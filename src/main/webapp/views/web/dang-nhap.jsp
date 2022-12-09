<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp" %>
<style>
	body {
		font-size: 1.7rem;
	}
</style>
<div class="justify-content-center row" style="margin-top: 10rem">
	
	<form action="" method="post" class="col-5 justify-content-center">
	<h1 class="row justify-content-center">Sign In</h1>
  <!-- Email input -->
  <div class="form-outline mb-4">
    <label class="form-label" for="form2Example1">Email address</label>
    <input type="email" id="form2Example1" class="form-control" name="email" style="text-transform: none;font-size: 1.7rem;"/>
  </div>

  <!-- Password input -->
  <div class="form-outline mb-4">
  <label class="form-label" for="form2Example2">Password</label>
    <input type="password" id="form2Example2" class="form-control" name="password" style="text-transform: none;font-size: 1.7rem;"/>
    
  </div>

  <!-- 2 column grid layout for inline styling -->
  <div class="row mb-4">
    <div class="col d-flex justify-content-center">
      <!-- Checkbox -->
      <div class="form-check">
        <input class="form-check-input" type="checkbox" value="" id="form2Example31" checked />
        <label class="form-check-label" for="form2Example31"> Remember me </label>
      </div>
    </div>

    <div class="col">
      <!-- Simple link -->
      <a href="#!">Forgot password?</a>
    </div>
  </div>

  <!-- Submit button -->
  <button type="submit" class="btn-buy btn-block mb-4">Sign in</button>

  <!-- Register buttons -->
  <div class="text-center">
  	
    <p>Not a member? <a href='<c:url value="/dang-ky"/>'>Register</a></p>
  </div>
</form>
</div>
