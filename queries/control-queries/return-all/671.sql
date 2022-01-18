select count(ws.ws_item_sk)
from web_sales ws,warehouse w,web_returns wr,customer_demographics cd,date_dim d
where ws.ws_warehouse_sk = w.w_warehouse_sk and ws.ws_order_number = wr.wr_order_number and ws.ws_bill_cdemo_sk = cd.cd_demo_sk and wr.wr_returned_date_sk = d.d_date_sk and ws.ws_hash >= 405 and ws.ws_hash <= 805 and cd.cd_hash >= 349 and cd.cd_hash <= 682 and d.d_hash >= 188 and d.d_hash <= 938
;
