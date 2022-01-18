select count(ws.ws_item_sk)
from web_sales ws,item i,customer_demographics cd,warehouse w,web_returns wr
where ws.ws_item_sk = i.i_item_sk and ws.ws_bill_cdemo_sk = cd.cd_demo_sk and ws.ws_warehouse_sk = w.w_warehouse_sk and ws.ws_order_number = wr.wr_order_number and ws.ws_hash >= 213 and ws.ws_hash <= 963 and i.i_hash >= 38 and i.i_hash <= 371 and cd.cd_hash >= 99 and cd.cd_hash <= 499
;
