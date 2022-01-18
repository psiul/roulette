select count(ss.ss_item_sk)
from store_sales ss,customer c,store_returns sr,household_demographics hd,customer_demographics cd
where ss.ss_customer_sk = c.c_customer_sk and ss.ss_ticket_number = sr.sr_ticket_number and c.c_current_hdemo_sk = hd.hd_demo_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hash >= 253 and ss.ss_hash <= 653 and c.c_hash >= 296 and c.c_hash <= 629 and hd.hd_hash >= 118 and hd.hd_hash <= 868
;
