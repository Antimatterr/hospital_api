import CustomErrorHandler from "../services/CustomErrorHandler";

const auth = async (req, res, next) => {
  let authHeader = req.headers.psychiatrist_id;
  console.log(authHeader);

  if (!authHeader) {
    return next(CustomErrorHandler.unAuthorized());
  }
  next();
}


export default auth;