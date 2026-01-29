import 'package:go_router/go_router.dart';
import 'package:ytnkio/core_module.dart';
import 'package:ytnkio/models/profile/certificate.dart';
import 'package:ytnkio/pages/profile/edit_certificate_page.dart';
import 'package:ytnkio/widgets/common/edit_button.dart';

class CertificateCard extends StatelessWidget {
  final Certificate certificate;
  final bool isLast;

  const CertificateCard(
      {super.key, required this.certificate, required this.isLast});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        certificate.name,
                        style: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            overflow: TextOverflow.ellipsis),
                      ),
                      Text(
                        certificate.issuer,
                        style: const TextStyle(
                            color: Colors.grey, fontStyle: FontStyle.normal),
                      ),
                    ],
                  ),
                ),
              ),
              EditButton(
                onEditCallback: () {
                  context.push(EditCertificatePage.id, extra: certificate);
                },
              ),
            ],
          ),
          const SizedBox(
            height: 5,
          ),
          Text(certificate.description),
          const SizedBox(
            height: 5,
          ),
          isLast ? const SizedBox() : const Divider()
        ],
      ),
    );
  }
}
