select count(ws.ws_item_sk)
from web_sales ws,customer c,web_returns wr,customer_demographics cd,item i
where ws.ws_bill_customer_sk = c.c_customer_sk and ws.ws_order_number = wr.wr_order_number and c.c_current_cdemo_sk = cd.cd_demo_sk and ws.ws_item_sk = i.i_item_sk and ws.ws_hash >= 46 and ws.ws_hash <= 796 and cd.cd_hash >= 533 and cd.cd_hash <= 866 and i.i_hash >= 48 and i.i_hash <= 448
;
