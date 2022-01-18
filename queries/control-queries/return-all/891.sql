select count(ws.ws_item_sk)
from web_sales ws,date_dim d,warehouse w,web_returns wr,customer_demographics cd
where ws.ws_sold_date_sk = d.d_date_sk and ws.ws_warehouse_sk = w.w_warehouse_sk and ws.ws_order_number = wr.wr_order_number and ws.ws_bill_cdemo_sk = cd.cd_demo_sk and ws.ws_hash >= 127 and ws.ws_hash <= 877 and d.d_hash >= 308 and d.d_hash <= 641 and cd.cd_hash >= 149 and cd.cd_hash <= 549
;
