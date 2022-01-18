select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,item i,household_demographics hd,store_returns sr
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_ticket_number = sr.sr_ticket_number and ss.ss_hash >= 385 and ss.ss_hash <= 785 and i.i_hash >= 136 and i.i_hash <= 886 and hd.hd_hash >= 18 and hd.hd_hash <= 351
;
