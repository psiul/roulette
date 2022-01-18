select count(ss.ss_item_sk)
from store_sales ss,store_returns sr,household_demographics hd,item i,customer_demographics cd
where ss.ss_ticket_number = sr.sr_ticket_number and ss.ss_hdemo_sk = hd.hd_demo_sk and sr.sr_item_sk = i.i_item_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and hd.hd_hash >= 530 and hd.hd_hash <= 930 and i.i_hash >= 79 and i.i_hash <= 412 and cd.cd_hash >= 8 and cd.cd_hash <= 758
;
