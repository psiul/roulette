select count(ws.ws_item_sk)
from web_sales ws,warehouse w,web_returns wr,customer c,customer_demographics cd
where ws.ws_warehouse_sk = w.w_warehouse_sk and ws.ws_order_number = wr.wr_order_number and ws.ws_bill_customer_sk = c.c_customer_sk and c.c_current_cdemo_sk = cd.cd_demo_sk and ws.ws_hash >= 272 and ws.ws_hash <= 672 and c.c_hash >= 50 and c.c_hash <= 800 and cd.cd_hash >= 381 and cd.cd_hash <= 714
;
