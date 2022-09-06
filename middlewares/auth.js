import CustomErrorHandler from "../services/CustomErrorHandler";

const auth = async (req, res, next) => {

  let authHeader = req.headers.authorization; //psychiatrist id or his token
  console.log(authHeader);

  if (!authHeader) {
    return next(CustomErrorHandler.unAuthorized());
  }
  next();
}

// const patientAuth = async (req, res, next) => {
//   let authHeader = req.header.authorization;
//   console.log(authHeader);
//   if (!authHeader) {
//     return next(CustomErrorHandler.unAuthorized());
//   }

//   next();
// }


export default auth;