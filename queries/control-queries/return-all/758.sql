select count(ws.ws_item_sk)
from web_sales ws,web_returns wr,date_dim d,customer_demographics cd,warehouse w
where ws.ws_order_number = wr.wr_order_number and ws.ws_ship_date_sk = d.d_date_sk and ws.ws_bill_cdemo_sk = cd.cd_demo_sk and ws.ws_warehouse_sk = w.w_warehouse_sk and ws.ws_hash >= 220 and ws.ws_hash <= 620 and d.d_hash >= 560 and d.d_hash <= 893 and cd.cd_hash >= 19 and cd.cd_hash <= 769
;
