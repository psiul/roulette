select count(ws.ws_item_sk)
from web_sales ws,customer_demographics cd,item i,customer c,web_returns wr
where ws.ws_bill_cdemo_sk = cd.cd_demo_sk and ws.ws_item_sk = i.i_item_sk and ws.ws_bill_customer_sk = c.c_customer_sk and ws.ws_order_number = wr.wr_order_number and ws.ws_hash >= 134 and ws.ws_hash <= 884 and cd.cd_hash >= 597 and cd.cd_hash <= 930 and i.i_hash >= 315 and i.i_hash <= 715
;
