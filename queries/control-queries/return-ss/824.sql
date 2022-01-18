select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,household_demographics hd,customer c,store_returns sr
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_ticket_number = sr.sr_ticket_number and cd.cd_hash >= 157 and cd.cd_hash <= 907 and hd.hd_hash >= 383 and hd.hd_hash <= 783 and c.c_hash >= 534 and c.c_hash <= 867
;
