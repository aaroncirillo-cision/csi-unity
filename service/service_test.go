package service

import (
	"context"
	"fmt"
	"strings"
	"testing"

	"github.com/dell/csi-unity/service/utils"
	"github.com/stretchr/testify/assert"
	"google.golang.org/grpc/metadata"
)

func TestGetDriverConfig(t *testing.T) {
	DriverConfig = testConf.unityConfig
	err := testConf.service.syncDriverConfig(context.Background(), nil)
	if err != nil {
		t.Fatalf("TestBeforeServe failed with error %v", err)
	}
	if testConf.service.getStorageArrayLength() == 0 {
		t.Fatalf("Credentials are empty")
	}
}

func TestSetRunIdContext(t *testing.T) {
	ctx, log := setRunIDContext(context.Background(), "test")
	headers, _ := metadata.FromIncomingContext(ctx)
	assert.True(t, headers["csi.requestid"][0] == "test", "csi.requestid not found after setting the runid")
	assert.True(t, log.Data[utils.RUNID] == "test", "logger doesn't contain the expected message")
}

func TestGetVolumeIdFromVolumeContext(t *testing.T) {
	//When old id
	id := getVolumeIDFromVolumeContext("id_1234")
	assert.True(t, id == "id_1234", "Expected id_1234 but found [%s]", id)
	id = getVolumeIDFromVolumeContext("name1234-arrid1234-id_1234")
	assert.True(t, id == "id_1234", "Expected id_1234 but found [%s]", id)
	id = getVolumeIDFromVolumeContext("csivol-name1234-arrid1234-id_1234")
	assert.True(t, id == "id_1234", "Expected id_1234 but found [%s]", id)
	id = getVolumeIDFromVolumeContext("")
	assert.True(t, id == "", "Expected [] but found [%s]", id)
}

func TestGetArrayIdFromVolumeContext(t *testing.T) {
	//When old id
	id, _ := testConf.service.getArrayIDFromVolumeContext("id_1234")
	assert.True(t, id == testConf.defaultArray, "Expected [%s] but found [%s]", testConf.defaultArray, id)
	id, _ = testConf.service.getArrayIDFromVolumeContext("name1234-arrid1234-id_1234")
	assert.True(t, id == "arrid1234", "Expected arrid1234 but found [%s]", id)
	id, _ = testConf.service.getArrayIDFromVolumeContext("csivol-name1234-arrid1234-id_1234")
	assert.True(t, id == "arrid1234", "Expected arrid1234 but found [%s]", id)
	id, _ = testConf.service.getArrayIDFromVolumeContext("")
	assert.True(t, id == "", "Expected [] but found [%s]", id)
}

func TestSetArrayIdContext(t *testing.T) {
	log := utils.GetLogger()
	ctx := context.Background()
	entry := log.WithField(utils.RUNID, "1111")
	ctx = context.WithValue(ctx, utils.UnityLogger, entry)

	logEntry := utils.GetRunidLogger(ctx)
	logEntry.Message = "Hi This is log test1"
	message, _ := logEntry.String()
	fmt.Println(message)
	assert.True(t, strings.Contains(message, `runid=1111 msg="Hi This is log test1"`), "Log message not found")

	//ctx, log, _ := GetRunidLog(ctx)
	ctx, entry = setArrayIDContext(ctx, "arr1111")
	entry.Message = "Hi this is TestSetArrayIdContext"
	message, _ = entry.String()
	assert.True(t, strings.Contains(message, `arrayid=arr1111 runid=1111 msg="Hi this is TestSetArrayIdContext"`), "Log message not found")
}
