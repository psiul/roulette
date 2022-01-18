select count(ss.ss_item_sk)
from store_sales ss,item i,customer c,household_demographics hd,store_returns sr
where ss.ss_item_sk = i.i_item_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_ticket_number = sr.sr_ticket_number and ss.ss_hash >= 186 and ss.ss_hash <= 519 and i.i_hash >= 583 and i.i_hash <= 983 and c.c_hash >= 214 and c.c_hash <= 964
;
