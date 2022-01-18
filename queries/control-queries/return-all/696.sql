select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,item i,customer_demographics cd,store_returns sr
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_ticket_number = sr.sr_ticket_number and ss.ss_hash >= 296 and ss.ss_hash <= 629 and hd.hd_hash >= 207 and hd.hd_hash <= 607 and i.i_hash >= 62 and i.i_hash <= 812
;
