<template>
  <div class="app-footer">
    <footer>
      <p>去玩网</p>
      <div>
        <span>移动端</span>
        <span>PC端</span>
        <span>APP</span>
      </div>
    </footer>
  </div>
</template>
<script>
export default {
  data(){
    return {}
  }
}
</script>
<style>
  footer{
    background-color:#fff;
    padding-bottom:30px;
    text-align: center;
    padding:20px 0; 
  }
  footer p{
    font-size:16px;
    color:#666;
    margin:0;
  }
  footer div span{
    font-size: 12px;
    padding:0px 10px;
  }
  footer div span:first-child{
    color:#666;
  }
</style>
