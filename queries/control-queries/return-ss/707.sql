select count(ss.ss_item_sk)
from store_sales ss,store_returns sr,household_demographics hd,customer c,item i
where ss.ss_ticket_number = sr.sr_ticket_number and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_hash >= 199 and ss.ss_hash <= 949 and c.c_hash >= 395 and c.c_hash <= 728 and i.i_hash >= 100 and i.i_hash <= 500
;
