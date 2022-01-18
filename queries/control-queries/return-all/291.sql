select count(ws.ws_item_sk)
from web_sales ws,date_dim d,customer_demographics cd,web_returns wr,warehouse w
where ws.ws_sold_date_sk = d.d_date_sk and ws.ws_bill_cdemo_sk = cd.cd_demo_sk and ws.ws_order_number = wr.wr_order_number and ws.ws_warehouse_sk = w.w_warehouse_sk and ws.ws_hash >= 372 and ws.ws_hash <= 772 and d.d_hash >= 18 and d.d_hash <= 351 and cd.cd_hash >= 76 and cd.cd_hash <= 826
;
