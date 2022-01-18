select count(ws.ws_item_sk)
from web_sales ws,item i,customer_demographics cd,web_returns wr,customer c
where ws.ws_item_sk = i.i_item_sk and ws.ws_bill_cdemo_sk = cd.cd_demo_sk and ws.ws_order_number = wr.wr_order_number and ws.ws_bill_customer_sk = c.c_customer_sk and ws.ws_hash >= 28 and ws.ws_hash <= 778 and i.i_hash >= 275 and i.i_hash <= 675 and c.c_hash >= 136 and c.c_hash <= 469
;
