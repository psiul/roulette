select count(ss.ss_item_sk)
from store_sales ss,item i,customer_demographics cd
where ss.ss_item_sk = i.i_item_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hash >= 502 and ss.ss_hash <= 902 and i.i_hash >= 96 and i.i_hash <= 846 and cd.cd_hash >= 245 and cd.cd_hash <= 578
;
