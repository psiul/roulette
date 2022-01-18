select count(ws.ws_item_sk)
from web_sales ws,web_returns wr,customer_demographics cd,warehouse w,date_dim d
where ws.ws_order_number = wr.wr_order_number and ws.ws_bill_cdemo_sk = cd.cd_demo_sk and ws.ws_warehouse_sk = w.w_warehouse_sk and ws.ws_sold_date_sk = d.d_date_sk and ws.ws_hash >= 15 and ws.ws_hash <= 765 and cd.cd_hash >= 543 and cd.cd_hash <= 943 and d.d_hash >= 17 and d.d_hash <= 350
;
