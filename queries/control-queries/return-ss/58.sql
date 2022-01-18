select count(ss.ss_item_sk)
from store_sales ss,item i,store_returns sr,customer c,household_demographics hd
where ss.ss_item_sk = i.i_item_sk and ss.ss_ticket_number = sr.sr_ticket_number and ss.ss_customer_sk = c.c_customer_sk and sr.sr_hdemo_sk = hd.hd_demo_sk and ss.ss_hash >= 151 and ss.ss_hash <= 551 and i.i_hash >= 233 and i.i_hash <= 983 and hd.hd_hash >= 261 and hd.hd_hash <= 594
;
