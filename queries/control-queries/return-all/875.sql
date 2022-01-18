select count(ws.ws_item_sk)
from web_sales ws,web_returns wr,customer_demographics cd,customer c,item i
where ws.ws_order_number = wr.wr_order_number and ws.ws_bill_cdemo_sk = cd.cd_demo_sk and ws.ws_bill_customer_sk = c.c_customer_sk and wr.wr_item_sk = i.i_item_sk and cd.cd_hash >= 50 and cd.cd_hash <= 800 and c.c_hash >= 109 and c.c_hash <= 509 and i.i_hash >= 127 and i.i_hash <= 460
;
