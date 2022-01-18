select count(ss.ss_item_sk)
from store_sales ss,store_returns sr,item i,customer c,household_demographics hd
where ss.ss_ticket_number = sr.sr_ticket_number and sr.sr_item_sk = i.i_item_sk and ss.ss_customer_sk = c.c_customer_sk and sr.sr_hdemo_sk = hd.hd_demo_sk and ss.ss_hash >= 319 and ss.ss_hash <= 652 and i.i_hash >= 20 and i.i_hash <= 770 and c.c_hash >= 223 and c.c_hash <= 623
;
