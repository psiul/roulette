select count(ws.ws_item_sk)
from web_sales ws,web_returns wr,customer c,customer_demographics cd,item i
where ws.ws_order_number = wr.wr_order_number and wr.wr_refunded_customer_sk = c.c_customer_sk and ws.ws_bill_cdemo_sk = cd.cd_demo_sk and ws.ws_item_sk = i.i_item_sk and c.c_hash >= 66 and c.c_hash <= 816 and cd.cd_hash >= 247 and cd.cd_hash <= 580 and i.i_hash >= 406 and i.i_hash <= 806
;
