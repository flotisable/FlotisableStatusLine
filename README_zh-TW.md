# Flotisable Status Line
我個人使用的 vim 狀態列設定插件

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
左邊是 TUI 右邊是 GUI
![screenshot](screenshot.png)

# 狀態列欄位
我將整個狀態列分成了五個欄位，每個欄位可以設定不同的顏色

## Git 分支欄位
如果當前目錄屬於某個 git 倉庫的話，這個欄位會顯示現在所在的分支‧
這個功能是根據 `.git` 資料夾的資料完成的‧
所以如果 **.git** 資料夾不存在，那這個欄位會是空的‧
這個欄位在非當前視窗會被拿掉

## 標籤欄位
這個欄位會以下列順序顯示 vim 的標籤

  1. 預覽
  2. 幫助
  3. 唯讀
  4. 被修改
  5. 檔案類型

這個欄位在非當前視窗顏色會變暗

## 檔案名稱欄位
這個欄位會顯示相對於當前工作資料夾的檔案路徑。
如果右邊欄位空間不夠的話，會只顯示一部份


## 游標位置欄位
這個欄位會以下列格式顯示游標所在位置

```
<行數>, <列數>  <占整個檔案的百分比>
```

這個欄位在非當前視窗顏色會變暗

## 時間欄位
這個欄位會顯示系統時間‧
這個欄位在非當前視窗會被拿掉

# 自定欄位顏色
要在 vimrc 中自定欄位顏色的話，
只要用 `highlight` 命令設定對應的 highlight group 就可以了

支援的 hightlight group 列在下面

| Hightlight Group            | 欄位          |
| --------------------------- | ------------- |
| FtStatusLineGitBranch       | git 分支欄位  |
| FtStatusLineFlag            | 標籤欄位      |
| FtStatusLineFileName        | 檔案名稱欄位  |
| FtStatusLineCursorPosition  | 游標位置欄位  |
| FtStatusLineTime            | 時間欄位      |
| FtStatusLineFaded           | 變暗的欄位    |
