select count(ws.ws_item_sk)
from web_sales ws,customer c,web_returns wr,item i,customer_demographics cd
where ws.ws_bill_customer_sk = c.c_customer_sk and ws.ws_order_number = wr.wr_order_number and wr.wr_item_sk = i.i_item_sk and ws.ws_bill_cdemo_sk = cd.cd_demo_sk and ws.ws_hash >= 72 and ws.ws_hash <= 822 and c.c_hash >= 251 and c.c_hash <= 584 and i.i_hash >= 50 and i.i_hash <= 450
;
