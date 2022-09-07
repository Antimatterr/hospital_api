class CustomErrorHandler extends Error {
  constructor(status, msg) {
    super();
    this.status = status;
    this.message = msg;
  }

  static notFound(message = '404 not found') {
    return new CustomErrorHandler(404, message);
  }

  static serverError(message = 'Internal server error') {
    return new CustomErrorHandler(500, message);
  }

  static unAuthorized(message = 'unAuthorized') {
    return new CustomErrorHandler(401, message);
  }

  static resourceNotFound(message = 'resource not found') {
    return new CustomErrorHandler(204, message);
  }

  static alreadyExist(message) {
    return new CustomErrorHandler(409, message);
  }

}


export default CustomErrorHandler;