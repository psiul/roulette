select count(ws.ws_item_sk)
from web_sales ws,date_dim d,customer_demographics cd,warehouse w,web_returns wr
where ws.ws_sold_date_sk = d.d_date_sk and ws.ws_bill_cdemo_sk = cd.cd_demo_sk and ws.ws_warehouse_sk = w.w_warehouse_sk and ws.ws_order_number = wr.wr_order_number and ws.ws_hash >= 132 and ws.ws_hash <= 532 and d.d_hash >= 165 and d.d_hash <= 915 and cd.cd_hash >= 396 and cd.cd_hash <= 729
;
