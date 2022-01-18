select count(ws.ws_item_sk)
from web_sales ws,date_dim d,web_returns wr,customer_demographics cd,warehouse w
where ws.ws_sold_date_sk = d.d_date_sk and ws.ws_order_number = wr.wr_order_number and ws.ws_bill_cdemo_sk = cd.cd_demo_sk and ws.ws_warehouse_sk = w.w_warehouse_sk and ws.ws_hash >= 367 and ws.ws_hash <= 767 and d.d_hash >= 212 and d.d_hash <= 962 and cd.cd_hash >= 404 and cd.cd_hash <= 737
;
