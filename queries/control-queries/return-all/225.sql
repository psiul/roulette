select count(ws.ws_item_sk)
from web_sales ws,date_dim d,warehouse w,customer_demographics cd,web_returns wr
where ws.ws_ship_date_sk = d.d_date_sk and ws.ws_warehouse_sk = w.w_warehouse_sk and ws.ws_bill_cdemo_sk = cd.cd_demo_sk and ws.ws_order_number = wr.wr_order_number and ws.ws_hash >= 131 and ws.ws_hash <= 531 and d.d_hash >= 366 and d.d_hash <= 699 and cd.cd_hash >= 1 and cd.cd_hash <= 751
;
