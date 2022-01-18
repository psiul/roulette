select count(ss.ss_item_sk)
from store_sales ss,item i,store_returns sr,customer c,household_demographics hd
where ss.ss_item_sk = i.i_item_sk and ss.ss_ticket_number = sr.sr_ticket_number and sr.sr_customer_sk = c.c_customer_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_hash >= 439 and ss.ss_hash <= 772 and i.i_hash >= 386 and i.i_hash <= 786 and hd.hd_hash >= 8 and hd.hd_hash <= 758
;
