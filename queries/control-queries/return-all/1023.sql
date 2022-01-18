select count(ws.ws_item_sk)
from web_sales ws,warehouse w,customer_demographics cd,date_dim d,web_returns wr
where ws.ws_warehouse_sk = w.w_warehouse_sk and ws.ws_bill_cdemo_sk = cd.cd_demo_sk and ws.ws_ship_date_sk = d.d_date_sk and ws.ws_order_number = wr.wr_order_number and ws.ws_hash >= 296 and ws.ws_hash <= 629 and cd.cd_hash >= 369 and cd.cd_hash <= 769 and d.d_hash >= 50 and d.d_hash <= 800
;
