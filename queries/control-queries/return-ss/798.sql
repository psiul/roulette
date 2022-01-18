select count(ss.ss_item_sk)
from store_sales ss,item i,store_returns sr,household_demographics hd,customer c
where ss.ss_item_sk = i.i_item_sk and ss.ss_ticket_number = sr.sr_ticket_number and ss.ss_hdemo_sk = hd.hd_demo_sk and sr.sr_customer_sk = c.c_customer_sk and i.i_hash >= 305 and i.i_hash <= 638 and hd.hd_hash >= 400 and hd.hd_hash <= 800 and c.c_hash >= 33 and c.c_hash <= 783
;
