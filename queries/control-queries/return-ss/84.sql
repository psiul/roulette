select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,store_returns sr,customer c,item i
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_ticket_number = sr.sr_ticket_number and sr.sr_customer_sk = c.c_customer_sk and sr.sr_item_sk = i.i_item_sk and ss.ss_hash >= 579 and ss.ss_hash <= 979 and hd.hd_hash >= 515 and hd.hd_hash <= 848 and i.i_hash >= 155 and i.i_hash <= 905
;
