// core/dio/end_points.dart
enum Endpoint {
  login,
  sendCode,
  verifyCode,
  resetCode,
  resetPasswordEmail,
  resetPassword,
  socialLogin,
  register,
  changePassword,
  getUserData,
  updateUserData,
  deleteAccount,
  contactUs,
  resendMail,
  //
  getCategories,
  getCrat,
  getproduct,
  addStore,
  updateStore,
  myStores,
  editStore,
  deleteStore,
  storeServices,
  addService,
  editService,
  updateService,
  deleteService,
  getDays,
  //
  showSettings,
  updateSettings,
  storeSettings,
  //
  storeEmployees,
  addEmployee,
  showEmployee,
  updateEmployee,
  deleteEmployee,
  //
  storeResponsibilities,
  addResponsibility,
  showResponsibility,
  updateResponsibility,
  deleteResponsibility,
  //
  storeRoles,
  storePermissions,
  addRole,
  showRole,
  updateRole,
  deleteRole,
  //
  getGallery,
  updateGallery,
  deleteImage,
  //
  getStoreTime,
  updateStoreTime,
  //
  getPages,
  //
  getBookings,
  addBooking,
  cancelBookings,
  cancelReasons,
  reportReservation,
  //
  getNotifications,
}

extension EndpointExtension on Endpoint {
  String get value {
    switch (this) {
      case Endpoint.login:
        return 'login';
      case Endpoint.sendCode:
        return 'resend-verification-code';
      case Endpoint.verifyCode:
        return 'verify-email';
      case Endpoint.resetCode:
        return 'verify-code';
      case Endpoint.resetPasswordEmail:
        return 'reset-password-email';
      case Endpoint.resetPassword:
        return 'reset-password';
      case Endpoint.getCategories:
        return 'products/category-list';
      case Endpoint.getproduct:
        return 'products/category/smartphones';
      case Endpoint.getCrat:
        return 'carts';
      case Endpoint.addStore:
        return 'shops';
      case Endpoint.myStores:
        return 'shops';
      case Endpoint.editStore:
        return 'shops';
      case Endpoint.updateStore:
        return 'shops';
      case Endpoint.deleteStore:
        return 'shops';
      case Endpoint.storeServices:
        return 'services-at-shop';
      case Endpoint.addService:
        return 'services';
      case Endpoint.editService:
        return 'services';
      case Endpoint.updateService:
        return 'services';
      case Endpoint.deleteService:
        return 'services';
      case Endpoint.getDays:
        return 'days';
      case Endpoint.reportReservation:
        return 'report';
      //
      case Endpoint.getNotifications:
        return 'local-notifications';
      //
      case Endpoint.showSettings:
        return 'general-settings';
      case Endpoint.updateSettings:
        return 'general-settings';
      case Endpoint.storeSettings:
        return 'general-settings';
      //
      case Endpoint.getBookings:
        return 'bookings-at-shop';
      case Endpoint.addBooking:
        return 'bookings';
      case Endpoint.cancelBookings:
        return 'canceled-bookings';
      case Endpoint.cancelReasons:
        return 'report-reasons';
      //
      case Endpoint.storeEmployees:
        return 'employees-at-shop';
      case Endpoint.addEmployee:
        return 'employees';
      case Endpoint.showEmployee:
        return 'employees';
      case Endpoint.updateEmployee:
        return 'employees';
      case Endpoint.deleteEmployee:
        return 'employees';

      case Endpoint.storeResponsibilities:
        return 'responsibles-at-shop';
      case Endpoint.addResponsibility:
        return 'responsibles';
      case Endpoint.showResponsibility:
        return 'responsibles';
      case Endpoint.updateResponsibility:
        return 'responsibles';
      case Endpoint.deleteResponsibility:
        return 'responsibles';

      case Endpoint.storeRoles:
        return 'roles-at-shop';
      case Endpoint.storePermissions:
        return 'permissions';
      case Endpoint.addRole:
        return 'roles';
      case Endpoint.deleteRole:
        return 'roles';
      case Endpoint.showRole:
        return 'roles';
      case Endpoint.updateRole:
        return 'roles';
      //
      case Endpoint.getPages:
        return 'privacy-and-policies';
      //
      case Endpoint.getGallery:
        return 'shop-galleries';
      case Endpoint.updateGallery:
        return 'add-shop-galleries';
      case Endpoint.deleteImage:
        return 'shop-galleries';
      //
      case Endpoint.getStoreTime:
        return 'shop-schedules-at-shop';
      case Endpoint.updateStoreTime:
        return 'multiple-schedules-at-shop';
      //
      case Endpoint.socialLogin:
        return 'login-by-gmail';
      case Endpoint.register:
        return 'register';
      case Endpoint.changePassword:
        return 'change-password';
      case Endpoint.getUserData:
        return 'show-profile';
      case Endpoint.updateUserData:
        return 'update-profile';
      case Endpoint.deleteAccount:
        return 'delete-account';
      case Endpoint.contactUs:
        return 'contact-us';
      case Endpoint.resendMail:
        return 'resend-email';
    }
  }
}
