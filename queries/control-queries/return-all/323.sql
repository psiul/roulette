select count(ws.ws_item_sk)
from web_sales ws,item i,web_returns wr,customer_demographics cd,warehouse w
where ws.ws_item_sk = i.i_item_sk and ws.ws_order_number = wr.wr_order_number and ws.ws_bill_cdemo_sk = cd.cd_demo_sk and ws.ws_warehouse_sk = w.w_warehouse_sk and ws.ws_hash >= 104 and ws.ws_hash <= 854 and i.i_hash >= 89 and i.i_hash <= 422 and cd.cd_hash >= 393 and cd.cd_hash <= 793
;
