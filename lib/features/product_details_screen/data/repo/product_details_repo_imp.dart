import 'package:blinkbuy/core/model/item/product_item_entity.dart';
import 'package:blinkbuy/core/networking/result_api.dart';
import 'package:blinkbuy/features/product_details_screen/domain/repo/product_details_data_source_interface.dart';
import 'package:blinkbuy/features/product_details_screen/domain/repo/product_details_repo_interface.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: ProductDetailsRepoInterface)
class ProductDetailsRepoImp implements ProductDetailsRepoInterface {
	final ProductDetailsDataSourceInterface _dataSource;

	ProductDetailsRepoImp(this._dataSource);

	@override
	Future<ResultApi<ProductItemEntity>> getProductDetails(int productId) {
		return _dataSource.getProductDetails(productId);
	}
}
