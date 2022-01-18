select count(ws.ws_item_sk)
from web_sales ws,item i,household_demographics hd,customer_demographics cd,web_returns wr
where ws.ws_item_sk = i.i_item_sk and ws.ws_bill_hdemo_sk = hd.hd_demo_sk and ws.ws_bill_cdemo_sk = cd.cd_demo_sk and ws.ws_order_number = wr.wr_order_number and ws.ws_hash >= 459 and ws.ws_hash <= 859 and hd.hd_hash >= 44 and hd.hd_hash <= 794 and cd.cd_hash >= 558 and cd.cd_hash <= 891
;
