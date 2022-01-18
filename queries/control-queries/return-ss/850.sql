select count(ss.ss_item_sk)
from store_sales ss,item i,household_demographics hd,store_returns sr,customer c
where ss.ss_item_sk = i.i_item_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_ticket_number = sr.sr_ticket_number and sr.sr_customer_sk = c.c_customer_sk and ss.ss_hash >= 91 and ss.ss_hash <= 841 and hd.hd_hash >= 408 and hd.hd_hash <= 741 and c.c_hash >= 422 and c.c_hash <= 822
;
