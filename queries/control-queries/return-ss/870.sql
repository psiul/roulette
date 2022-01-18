select count(ss.ss_item_sk)
from store_sales ss,item i,store_returns sr,customer c,household_demographics hd
where ss.ss_item_sk = i.i_item_sk and ss.ss_ticket_number = sr.sr_ticket_number and sr.sr_customer_sk = c.c_customer_sk and c.c_current_hdemo_sk = hd.hd_demo_sk and ss.ss_hash >= 211 and ss.ss_hash <= 961 and i.i_hash >= 459 and i.i_hash <= 859 and c.c_hash >= 128 and c.c_hash <= 461
;
