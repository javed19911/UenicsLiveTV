import 'package:flutter/material.dart';

abstract class Language {
  static Language of(BuildContext context) {
    return Localizations.of(context, Language);
  }

  String get selectedLanguage;

  String get userLabel;

  String get passwordLabel;

  String get loginLabel;

  String get logOutLabel;

  String get requiredWarningText;

  String get labelCreateNewLot;

  String get labelReferAndEarn;

  String get labelSelectItems;

  String get labelClaimOffer;

  String get labelYouHaveNotCreateAnyLotsToday;

  String get labelWatchHowToUseTheApp;

  String get labelContactUsOnWhatsapp;

  String get labelItem;

  String get labelLanguagePreference;

  String get labelSave;

  String get labelRetake;

  String get labelAddAnotherPhotos;

  String get labelCreateLot;

  String get labelContactToBuy;

  String get labelEditLotDetails;

  String get labelMarkAsSold;

  String get labelQualityReport;

  String get labelMarkAsIncorrect;

  String get labelPercentage;

  String get labelPhotos;

  String get labelSendViaWhatsApp;

  String get labelLots;

  String get labelMy;

  String get labelBuy;

  String get labelNotify;

  String get labelToday;

  String get labelDate;

  String get labelNotifyBuyers;

  String get addToContact;

  String get addSelected;

  String get buyThisLot;

  String get displayText;

  String get enterDetails;

  String get quantity;

  String get price;

  String get variety;

  String get size;

  String get required;

  String get addAndCreateLot;

  String get addBuyers;

  String get searchContacts;

  String get addContactsHereToUpdateThemViaSms;

  String get theseContactsWillReceiveSmsWhenEverYouCreateYourLots;

  String get removeBuyerContact;

  String get descriptionRemoveBuyerContacts;

  String get cancel;

  String get remove;

  String get areYouSureYouHaveSoldLot;

  String get soldLotDescription;

  String get markAsSold;

  String get editLot;

  String get areYouSureQualityReportIsIncorrect;

  String get qualityReportIsIncorrectDescription;

  String get lotDetails;

  String get saveDetails;

  String get sold;

  String get lot;

  String get referDescription;

  String get shareWithContacts;

  String get collect;

  String get order;

  String get placeYourRequirement;

  String get deliveryLocation;

  String get provideUPIId;

  String get yourUPId;

  String get UPIId;

  String get verifyUPIId;

  String get confirmUPIId;

  String get enterAgain;

  String get provideDetails;

  String get enterFirstName;

  String get enterLastName;

  String get emailAddress;

  String get contactNumber;

  String get collectWithin24hrs;

  String get amountPayable;

  String get verified;

  String get discoverNewLots;

  String get todayLots;

  String get yesterdayLots;

  String get mySellerLots;
}
