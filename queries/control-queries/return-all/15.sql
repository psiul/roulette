select count(ws.ws_item_sk)
from web_sales ws,customer_demographics cd,warehouse w,date_dim d,web_returns wr
where ws.ws_bill_cdemo_sk = cd.cd_demo_sk and ws.ws_warehouse_sk = w.w_warehouse_sk and ws.ws_sold_date_sk = d.d_date_sk and ws.ws_order_number = wr.wr_order_number and ws.ws_hash >= 570 and ws.ws_hash <= 903 and cd.cd_hash >= 427 and cd.cd_hash <= 827 and d.d_hash >= 194 and d.d_hash <= 944
;
