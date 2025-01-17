enum StatusRequest {
  ///the start status
  none,

  ///request success
  success,

  ///loading on the full page
  loading,

  ///error on the full page 404
  failure,

  ///error401
  authorizedFailure,

  ///error403
  forbiddenFailure,

  ///timeout error on the full page
  timeOutFailure,

  ///offline error on the full page
  offlineFailure,

  ///small loading in the bottom of page
  paginating,

  ///toast error
  paginatingFailure,

  ///for refresh indicator
  refresh,

  ///loading part of the  page
  loadingPartOfPage,

  ///error part of the  page
  errorPartOfPage,

  ///status code 500
  internalServerError,

  ///server is stop and need fex 404 not found
  serverOnRepair
}

bool isThereAnError(StatusRequest statusRequest) {
  if (statusRequest == StatusRequest.failure ||
      statusRequest == StatusRequest.authorizedFailure ||
      statusRequest == StatusRequest.forbiddenFailure ||
      statusRequest == StatusRequest.timeOutFailure ||
      statusRequest == StatusRequest.offlineFailure ||
      statusRequest == StatusRequest.internalServerError ||
      statusRequest == StatusRequest.serverOnRepair) {
    return true;
  } else {
    return false;
  }
}
