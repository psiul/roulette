select count(ws.ws_item_sk)
from web_sales ws,date_dim d,web_returns wr,customer_demographics cd,warehouse w
where ws.ws_ship_date_sk = d.d_date_sk and ws.ws_order_number = wr.wr_order_number and wr.wr_returning_cdemo_sk = cd.cd_demo_sk and ws.ws_warehouse_sk = w.w_warehouse_sk and ws.ws_hash >= 199 and ws.ws_hash <= 532 and d.d_hash >= 153 and d.d_hash <= 553 and cd.cd_hash >= 95 and cd.cd_hash <= 845
;
