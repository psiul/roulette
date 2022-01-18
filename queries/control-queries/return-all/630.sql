select count(ws.ws_item_sk)
from web_sales ws,item i,household_demographics hd,customer_demographics cd,web_returns wr
where ws.ws_item_sk = i.i_item_sk and ws.ws_bill_hdemo_sk = hd.hd_demo_sk and ws.ws_bill_cdemo_sk = cd.cd_demo_sk and ws.ws_order_number = wr.wr_order_number and i.i_hash >= 148 and i.i_hash <= 898 and hd.hd_hash >= 421 and hd.hd_hash <= 821 and cd.cd_hash >= 428 and cd.cd_hash <= 761
;
