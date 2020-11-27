<template>
<div>
  <div class="box">
			<div class="inTer" id="father">
					<p>你好</p><br>
					<p>你好</p><br>
					<p>你好</p><br>
					<p>heiheiheiheiehieheieheieheieheiheiehe</p><br>
			</div>
			<textarea style="resize: none;" id="txt">
			</textarea>
			<input type="button" id="btn" value="发送" />
  </div>
</div>
</template>
<style>
.box {
  width: 300px;
  height: 400px;
  border: 1px solid blue;
  margin: 0 auto;
}
.inTer {
  width: 280px;
  height: 280px;
  border: 1px solid deeppink;
  margin: 0 auto;
  margin-top: 10px;
  overflow-y: auto;
}
textarea {
  display: block;
  width: 276px;
  height: 65px;
  margin: 0 auto;
  margin-top: 5px;
}
#btn {
  display: block;
  float: right;
  margin-right: 10px;
  margin-top: 5px;
}
p {
  border-radius: 5px;
  background: #dcdcdc;
  font-size: 12px;
  padding: 5px 5px;
  margin: 5px 0;
  margin-left: 5px;
  max-width: 140px;
  word-wrap: break-word;
}
</style>
