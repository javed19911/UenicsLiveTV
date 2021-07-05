import 'package:unics_live_tv/data/models/default_response.dart';
import 'package:unics_live_tv/data/models/mCategory.dart';

import 'mChannel.dart';

class ChannelResponse extends DefaultResponse {
  List<mCategory> _categories = [];

  ChannelResponse();

  List<mCategory> get categories => _categories;

  set categories(List<mCategory> value) {
    _categories = value;
  }

  ChannelResponse.fromJson(Map<String, dynamic> json) : super.fromJson(json) {
    if (json['categories'] != null) {
      _categories = new List<mCategory>.empty(growable: true);
      json['categories'].forEach((v) {
        _categories.add(new mCategory.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    var data = super.toJson();
    if (this._categories != null) {
      data['categories'] = this._categories.map((v) => v.toJson()).toList();
    }
    return data;
  }

  List<mCategory> getCategories() {
    // _categories.clear();
    // //Entertainment
    // mCategory category = mCategory();
    // category.name = "Entertainment";
    // category.channels = [];
    // mChannel channel = mChannel();
    // channel.name = "Star Plus";
    // channel.thumbnail =
    //     "https://img2.pngio.com/star-plus-png-and-star-plus-transparent-clipart-free-download-star-plus-png-260_320.jpg";
    // channel.deeplink = "https://www.hotstar.com/in#!/star-plus-821";
    // category.channels.add(channel);
    // _categories.add(category);
    //
    // mCategory category1 = mCategory();
    // category1.name = "News";
    // category1.channels = [];
    // mChannel channel1 = mChannel();
    // channel1.name = "India TV";
    // channel1.thumbnail =
    //     "https://www.nicepng.com/png/detail/367-3670818_india-tv-logo-png.png";
    // channel1.deeplink =
    //     "https://www.zee5.com/channels/details/india-tv/0-9-282";
    // category1.channels.add(channel1);
    // _categories.add(category1);
    _categories = ChannelResponse.fromJson(_defaultResponse()).categories;
    return _categories;
  }

  dynamic _defaultResponse() {
    return {
      "categories": [
        {
          "name": "Entertainment",
          "channels": [
            {
              "name": "Star Plus",
              "thumbnail":
                  "https://freepikpsd.com/wp-content/uploads/2019/10/Star-Plus-Logo-PNG-Images-HD.png",
              "deeplink": "https://www.hotstar.com/1260000017",
            }
          ]
        },
        {
          "name": "News",
          "channels": [
            {
              "name": "India TV",
              "thumbnail":
                  "https://apprecs.org/gp/images/app-icons/300/24/com.indiatv.livetv.jpg",
              "deeplink": "https://www.youtube.com/watch?v=6E7_A_eY8cg",
            },
            {
              "name": "Zee News",
              "thumbnail":
                  "https://english.cdn.zeenews.com/images/logo/zeenewslogo_nav.png",
              "deeplink":
                  "https://www.zee5.com/channels/details/zee-news/0-9-zeenews",
            },
            {
              "name": "ABP News",
              "thumbnail":
                  "https://static.wikia.nocookie.net/logopedia/images/e/eb/ABP_News.svg/revision/latest/scale-to-width-down/160?cb=20201222100643",
              "deeplink": "https://www.youtube.com/watch?v=yqcCKvJA_TU",
            },
            {
              "name": "NDTV Hindi",
              "thumbnail":
                  "https://upload.wikimedia.org/wikipedia/en/e/ed/NDTV_India.png",
              "deeplink": "https://www.youtube.com/watch?v=MN8p-Vrn6G0",
            },
            {
              "name": "News18 India",
              "thumbnail":
                  "https://upload.wikimedia.org/wikipedia/commons/2/24/News_18_India.png",
              "deeplink": "https://www.youtube.com/watch?v=ZPdHZgr1qCw",
            },
            {
              "name": "TV9 Bharatvarsh",
              "thumbnail":
                  "https://d2k7qun4ucuqn1.cloudfront.net/wp-content/uploads/2020/05/Tv9-Bharatvarsh.png",
              "deeplink": "https://www.youtube.com/watch?v=Xg1-mF4BJEk",
            },
            {
              "name": "Aaj Tak",
              "thumbnail":
                  "https://upload.wikimedia.org/wikipedia/commons/a/ab/AT-New-Logo-800x600.png",
              "deeplink": "https://www.youtube.com/watch?v=UUxkVYP36gA",
            },
            {
              "name": "Republic TV",
              "thumbnail":
                  "https://upload.wikimedia.org/wikipedia/commons/thumb/d/d8/Republicbharatlogo.png/440px-Republicbharatlogo.png",
              "deeplink": "https://www.youtube.com/watch?v=614UTCYPlVg",
            },
            {
              "name": "Zee Bihar Jharkhand",
              "thumbnail":
                  "https://akamaividz.zee5.com/image/upload/w_368,h_207,c_scale,f_auto,q_auto/resources/0-9-zeebiharjharkhand/channel_list/09zeebiharjharkhandzeebiha.png",
              "deeplink":
                  "https://www.zee5.com/channels/details/zee-bihar-jharkhand/0-9-zeebiharjharkhand",
            }
          ]
        },
        {
          "name": "Assamese News",
          "channels": [
            {
              "name": "News18 Assam/Northeast",
              "thumbnail":
                  "https://static.assam.news18.com/assam/uploads/2019/04/desktop-assam.png",
              "deeplink": "https://www.youtube.com/watch?v=qJM6vykmjZE",
            },
            {
              "name": "TIME8",
              "thumbnail":
                  "https://www.time8.in/wp-content/uploads/2019/06/LogoPositive-copy.png",
              "deeplink": "https://www.zee5.com/channels/details/time8/0-9-317",
            }
          ]
        }
      ]
    };
  }
}
