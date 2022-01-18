select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,customer c,store_returns sr,item i
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_ticket_number = sr.sr_ticket_number and sr.sr_item_sk = i.i_item_sk and ss.ss_hash >= 95 and ss.ss_hash <= 428 and hd.hd_hash >= 453 and hd.hd_hash <= 853 and i.i_hash >= 212 and i.i_hash <= 962
;
