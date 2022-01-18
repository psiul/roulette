select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,store_returns sr,item i,customer c
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_ticket_number = sr.sr_ticket_number and sr.sr_item_sk = i.i_item_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_hash >= 149 and ss.ss_hash <= 899 and hd.hd_hash >= 556 and hd.hd_hash <= 889 and i.i_hash >= 275 and i.i_hash <= 675
;
