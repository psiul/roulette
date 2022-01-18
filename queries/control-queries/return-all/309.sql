select count(ws.ws_item_sk)
from web_sales ws,customer_demographics cd,household_demographics hd,web_returns wr,item i
where ws.ws_bill_cdemo_sk = cd.cd_demo_sk and ws.ws_bill_hdemo_sk = hd.hd_demo_sk and ws.ws_order_number = wr.wr_order_number and ws.ws_item_sk = i.i_item_sk and ws.ws_hash >= 561 and ws.ws_hash <= 894 and hd.hd_hash >= 0 and hd.hd_hash <= 750 and i.i_hash >= 546 and i.i_hash <= 946
;
