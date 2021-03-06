# Flotisable Status Line
一個我個人使用的 vim 狀態列設定插件

# 索引
- [截圖](#截圖)
- [狀態列欄位](#狀態列欄位)
  - [Git 分支欄位](#git-分支欄位)
  - [標籤欄位](#標籤欄位)
  - [檔案名稱欄位](#檔案名稱欄位)
  - [游標位置欄位](#游標位置欄位)
  - [時間欄位](#時間欄位)
- [自定欄位顏色](#自定欄位顏色)

# 截圖
![screenshot](screenshot.png)

# 狀態列欄位
我將整個狀態列分成了五個欄位，每個欄位可以設定不同的顏色

## Git 分支欄位
如果開啟的檔案屬於某個 git 倉庫的話，這個欄位會顯示現在所在的分支

這個功能是用 **git** 這個指令做成的

所以如果這個指令不存在或是無法在終端機使用，那這個欄位會是空的，甚至可能會產生錯誤訊息

## 標籤欄位
這個欄位會一下列順序顯示 vim 的標籤

  1. preview
  2. help
  3. 唯讀
  4. 被修改
  5. 檔案類型

## 檔案名稱欄位
這個欄位會顯示相對於目前工作資料夾的檔案路徑

## 游標位置欄位
這個欄位會以下列格式顯示游標所在位置

  行數, 列數  占整個檔案的百分比

## 時間欄位
這個欄位會顯示系統時間

這個功能是用 **date** 這個指令做成的

所以如果這個指令不存在或是無法在終端機使用，那這個欄位會是空的，甚至可能會產生錯誤訊息

# 自定欄位顏色
要在 vimrc 中自定欄位顏色的話，先在 vimrc 中加上下面這一行

```
g:flotisableStatusLineCustomColor = 1
```

然後在將 **highlight** 命令加在這一行下面

個別欄位所對應的 hightlight group 列在下面

  - git 分支欄位  : User1
  - 標籤欄位      : User2
  - 檔案名稱欄位  : User3
  - 游標位置欄位  : User4
  - 時間欄位      : User5
